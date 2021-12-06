<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Cart;
use App\Models\Order;
use App\Models\OrderProduct;
use App\Models\ProductCart;
use JWTAuth;
use App\Http\Resources\CartResource;
use App\Http\Resources\CartCollection;

class CartController extends Controller
{
    public function fetchCart(Request $request)
    {
        $user = JWTAuth::toUser($request->token);
        if (Cart::where('user_id', $user->id)->first()->count() > 0) {
            $fetchCart = new CartResource(Cart::where('user_id', $user->id)->first());
        } else {
            $fetchCart = [
                "status" => "200"
            ];
        }
        return response()->json(['success' => true, 'data' => $fetchCart], 200);
    }

    public function addToCart(Request $request)
    {
        try {
            $user = JWTAuth::toUser($request->token);
            $checkCart = Cart::where('user_id', $user->id);
            if ($checkCart->get()->count() < 1) {
                $cart = new Cart;
                $cart->user_id = $user->id;
                $cart->save();
            } else {
                $cart = $checkCart->first();
            }
            $checkProductCart = ProductCart::where('product_id', $request->product_id)->where('cart_id', $cart->id);
            if ($checkProductCart->get()->count() > 0) {
                $qty = $checkProductCart->first()->quantity + $request->quantity;
                if ($qty == 0) {
                    $checkProductCart->delete();
                } else {
                    $checkProductCart->update(['quantity' => $qty]);
                }
            } else {
                $productCart = new ProductCart;
                $productCart->cart_id = $cart->id;
                $productCart->product_id = $request->product_id;
                $productCart->quantity = $request->quantity;
                $productCart->save();
            }
            return response()->json(['success' => true, 'data' => 'add to cart success'], 200);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'data' => $e->getMessage()], 500);
        }
    }

    public function deleteCartItem(Request $request)
    {
        try {
            $user = JWTAuth::toUser($request->token);
            $checkCart = Cart::where('user_id', $user->id);
            if ($checkCart->get()->count() > 0) {
                $cart = $checkCart->first();
                $checkProductCart = ProductCart::where('product_id', $request->product_id)->where('cart_id', $cart->id);
                if ($checkProductCart->get()->count() > 0) {
                    $checkProductCart->delete();
                    return response()->json(['success' => true, 'data' => 'Delete cart item success'], 200);
                }
            }
            return response()->json(['success' => true, 'data' => 'error'], 200);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'data' => $e->getMessage()], 500);
        }
    }

    public function checkout(Request $request)
    {
        try {
            $user = JWTAuth::toUser($request->token);
            $cart = Cart::where('user_id', $user->id)->first();
            $order = new Order;
            $order->user_id = $user->id;
            $order->status = 0;
            $order->sub_total = $request->sub_total;
            $order->shipping = $request->shipping;
            $order->promo = $request->promo;
            $order->discount = $request->discount;
            $order->total = $request->total;
            $order->first_name = $request->first_name;
            $order->last_name = $request->last_name;
            $order->email = $request->email;
            $order->phone_number = $request->phone_number;
            $order->address = $request->address;
            if ($order->save()){
                foreach ($request->order_product as $key => $order_product) {
                    $orderProduct = new OrderProduct;
                    $orderProduct->product_id = $order_product['product_id'];
                    $orderProduct->order_id = $order->id;
                    $orderProduct->price = $order_product['price'];
                    $orderProduct->discount = $order_product['discount'];
                    $orderProduct->total = $order_product['total'];
                    $orderProduct->quantity = $order_product['quantity'];
                    if ($orderProduct->save()){
                        ProductCart::where('product_id', $order_product['product_id'])->where('cart_id', $cart->id)->delete();
                    }
                }
                return response()->json(['success' => true, 'data' => 'Checkout product success'], 200);
            }
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'data' => $e->getMessage()], 500);
        }
    }
}
