using LanpingPage.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LanpingPage.Controllers
{
    public class CartController : Controller
    {
        private shopEntities db = new shopEntities(); // Use your actual context name

        // AddToCart action to handle adding products to the cart
        public ActionResult AddToCart(int id)
        {
            // Retrieve the product by id
            var product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }

            // Here you can add logic to add the product to the cart
            // For example, you might use session to store cart items
            // This is just an example, implement your cart logic as needed
            List<Product> cart = Session["Cart"] as List<Product> ?? new List<Product>();
            cart.Add(product);
            Session["Cart"] = cart;

            return RedirectToAction("Index", "Home"); // Redirect to the home page or any other page
        }
    }
}