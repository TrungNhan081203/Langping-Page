using LanpingPage.Context;
using LanpingPage.Models;
using System.Linq;
using System.Web.Mvc;
using System.Web.Security;

namespace LanpingPage.Controllers
{
    public class HomeController : Controller
    {
        private readonly shopEntities _context = new shopEntities();

        protected override void Dispose(bool disposing)
        {
            _context.Dispose();
            base.Dispose(disposing);
        }

        private int GetCurrentUserID()
        {
            // Replace this with your actual logic to get the logged-in user's ID
            // For example, you might retrieve it from the session or user identity
            return 1; // Example static ID, replace with actual user ID retrieval logic
        }

        public ActionResult Index()
        {
            // Fetch categories to populate ViewBag
            var categories = _context.Categories.ToList();
            ViewBag.Categories = categories;

            // Fetch products by categories
            var aoKhoacProducts = _context.Products.Where(p => p.CategoryID == 1).ToList();
            var damNuProducts = _context.Products.Where(p => p.CategoryID == 2).ToList();
            var aoThunProducts = _context.Products.Where(p => p.CategoryID == 3).ToList();

            var model = new ProductViewModel
            {
                DamNuProducts = damNuProducts,
                AoKhoacProducts = aoKhoacProducts,
                AoThunProducts = aoThunProducts
            };

            // Set the current user ID in ViewBag
            ViewBag.UserID = GetCurrentUserID();

            return View(model);
        }
        // GET: Account/Register
        public ActionResult Register()
        {
            return View();
        }

        // POST: Account/Register
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(User model)
        {
            if (ModelState.IsValid)
            {
                _context.Users.Add(model);
                _context.SaveChanges();
                TempData["SuccessMessage"] = "Đăng ký thành công!";
                return RedirectToAction("Login");
            }
            return View(model);
        }

        // GET: Account/Login
        public ActionResult Login()
        {
            return View();
        }

        // POST: Account/Login
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(User model)
        {
            var user = _context.Users.FirstOrDefault(u => u.Username == model.Username && u.Password == model.Password);
            if (user != null)
            {
                FormsAuthentication.SetAuthCookie(user.Username, false);
                return RedirectToAction("Index", "Home");
            }
            ViewBag.Error = "Sai tên đăng nhập hoặc mật khẩu";
            return View(model);
        }

        // GET: Account/Logout
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "Home");
        }
        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";
            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";
            return View();
        }
    }
}
