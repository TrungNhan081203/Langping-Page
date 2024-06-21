using LanpingPage.Context;
using LanpingPage.Models;
using System;
using System.Web.Mvc;

namespace LanpingPage.Controllers
{
    public class OrderController : Controller
    {
        private shopEntities db = new shopEntities(); // Replace with your actual context name

        [HttpPost]
        public ActionResult AddOrder(int Quantity, string Name, string Address, string Phone)
        {
            try
            {
                // Create a new user
                var user = new User
                {
                    FullName = Name,
                    Address = Address,
                    Phone = Phone
                };
                db.Users.Add(user);
                db.SaveChanges();

                // Create a new order
                var order = new Order
                {
                    UserID = user.UserID,
                    OrderDate = DateTime.Now,
                    Status = "pending"
                };
                db.Orders.Add(order);
                db.SaveChanges();

                // Create a new order detail (assuming you have ProductID available)
                var orderDetail = new OrderDetail
                {
                    OrderID = order.OrderID,
                    ProductID = 1, // Replace with the actual ProductID from your form or logic
                    Quantity = Quantity,
                    UnitPrice = 100, // Replace with the actual UnitPrice based on ProductID
                    Subtotal = Quantity * 100 // Replace with the actual calculation based on Quantity and UnitPrice
                };
                db.OrderDetails.Add(orderDetail);
                db.SaveChanges();

                return RedirectToAction("Index", "Home"); 
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Đã xảy ra lỗi khi lưu đơn hàng: " + ex.Message;
                return RedirectToAction("Index", "Home");  // Handle errors gracefully, display an error message, or redirect as needed
            }
        }
    }
}
