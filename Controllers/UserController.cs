using ShopGiay.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopGiay.Controllers
{
    public class UserController : Controller
    {
        DataClassesDataContext data = new DataClassesDataContext();
        // GET: User
        public ActionResult index()
        {
            var allacc = from a in data.GIAYs
                         join b in data.THUONGHIEUs on a.MATH equals b.MATH
                         join c in data.LOAIs on a.MALOAI equals c.MALOAI
                         join d in data.MAUSACs on a.MAMAUSAC equals d.MAMAUSAC
                         join e in data.KICHTHUOCs on a.MAKICHTHUOC equals e.MAKICHTHUOC
                         select new ProductViewModel
                         {
                             MAGIAY = a.MAGIAY,
                             TENGIAY = a.TENGIAY,
                             DONGIABAN = a.DONGIABAN,
                             HINHANH = a.HINHANH,
                             MATH = a.MATH,
                             MALOAI = a.MALOAI,
                             TENTH = b.TENTH,
                             TENLOAI = c.TENLOAI,
                             SOLUONG = a.SOLUONG,
                             MOTA = a.MOTA,
                             TENMAUSAC = d.TENMAUSAC,
                             TENKICHTHUOC = e.TENKICHTHUOC,
                             LOGO = b.LOGO
                         };

            return View(allacc);
        }
        public ActionResult blogs()
        {
            return View();
        }
        public ActionResult sanpham()
        {
            var allacc = from a in data.GIAYs
                         join b in data.THUONGHIEUs on a.MATH equals b.MATH
                         join c in data.LOAIs on a.MALOAI equals c.MALOAI
                         join d in data.MAUSACs on a.MAMAUSAC equals d.MAMAUSAC
                         join e in data.KICHTHUOCs on a.MAKICHTHUOC equals e.MAKICHTHUOC
                         select new ProductViewModel
                         {
                             MAGIAY = a.MAGIAY,
                             TENGIAY = a.TENGIAY,
                             DONGIABAN = a.DONGIABAN,
                             HINHANH = a.HINHANH,
                             MATH = a.MATH,
                             MALOAI = a.MALOAI,
                             TENTH = b.TENTH,
                             TENLOAI = c.TENLOAI,
                             SOLUONG = a.SOLUONG,
                             MOTA = a.MOTA,
                             TENMAUSAC = d.TENMAUSAC,
                             TENKICHTHUOC = e.TENKICHTHUOC
                         };

            return View(allacc);
        }
        public ActionResult hinhanh(int id)
        {
            var listhinhanh = from HINH in data.HINHs where HINH.MAGIAY == id select HINH;
            return PartialView(listhinhanh);
        }
        public ActionResult listhinhanhnho(int id)
        {
            var listhinhanhnho = from HINH in data.HINHs where HINH.MAGIAY == id select HINH;
            return PartialView(listhinhanhnho);
        }
        public ActionResult listhinhanhnhoduoi(int id)
        {
            var listhinhanhnho = from HINH in data.HINHs where HINH.MAGIAY == id select HINH;
            return PartialView(listhinhanhnho);
        }
        public ActionResult Chitiet(int id)
        {
            var detail = from a in data.GIAYs
                         join b in data.THUONGHIEUs on a.MATH equals b.MATH
                         join c in data.LOAIs on a.MALOAI equals c.MALOAI
                         join d in data.MAUSACs on a.MAMAUSAC equals d.MAMAUSAC
                         join e in data.KICHTHUOCs on a.MAKICHTHUOC equals e.MAKICHTHUOC
                         join h in data.HINHs on a.MAGIAY equals h.MAGIAY
                         where a.MAGIAY == id
                         select new ProductViewModel
                         {
                             MAGIAY = a.MAGIAY,                           
                             TENGIAY = a.TENGIAY,
                             DONGIABAN = a.DONGIABAN,
                             HINHANH = a.HINHANH,
                             MATH = a.MATH,
                             MALOAI = a.MALOAI,
                             TENTH = b.TENTH,
                             TENLOAI = c.TENLOAI,
                             SOLUONG = a.SOLUONG,
                             MOTA = a.MOTA,
                             TENMAUSAC = d.TENMAUSAC,
                             TENKICHTHUOC = e.TENKICHTHUOC,
                             HINH1 = h.HINH1
                         };
            return View(detail.FirstOrDefault());
        }
        public ActionResult gioithieu()
        {
            return View();
        }
        
        public ActionResult giohang()
        {
            return View();
        }
        public ActionResult loai()
        {
            var listloai = from LOAI in data.LOAIs select LOAI;
            return PartialView(listloai);
        }
        public ActionResult kichthuoc()
        {
            var listkichthuoc = from KICHTHUOC in data.KICHTHUOCs select KICHTHUOC;
            return PartialView(listkichthuoc);
        }
        public ActionResult thuonghieu()
        {
            var listthuonghieu = from THUONGHIEU in data.THUONGHIEUs select THUONGHIEU;
            return PartialView(listthuonghieu);
        }
        public ActionResult hinhthuonghieu()
        {
            var listthuonghieu = from THUONGHIEU in data.THUONGHIEUs select THUONGHIEU;
            return PartialView(listthuonghieu);
        }
        public ActionResult SPTheoloai(int id)
        {
            var sanpham = from GIAY in data.GIAYs where GIAY.MALOAI == id select GIAY;
            return View(sanpham);
        }
        public ActionResult SPTheokichthuoc(int id)
        {
            var sanpham = from GIAY in data.GIAYs where GIAY.MAKICHTHUOC == id select GIAY;
            return View(sanpham);
        }
        public ActionResult SPTheothuonghieu(int id)
        {
            var sanpham = from GIAY in data.GIAYs where GIAY.MATH == id select GIAY;
            return View(sanpham);
        }


        //Đăng ký và Đăng Nhập
        [HttpGet]
        public ActionResult dangky()
        {
            return View();
        }      
        
        [HttpPost]
        public ActionResult dangky(FormCollection collection, KHACHHANG kh)
        {
            // Gán các giá tị người dùng nhập liệu cho các biến 
            var hoten = collection["HotenKH"];
            var tendn = collection["TenDN"];
            var matkhau = collection["Matkhau"];
            var matkhaunhaplai = collection["Matkhaunhaplai"];
            var diachi = collection["Diachi"];
            var hinhanh = collection["Hinhanh"];
            var email = collection["Email"];
            var dienthoai = collection["Dienthoai"];
            var ngaysinh = String.Format("{0:MM/dd/yyyy}", collection["Ngaysinh"]);
            if (String.IsNullOrEmpty(hoten))
            {
                ViewData["Loi1"] = "Họ tên khách hàng không được để trống";
            }
            else if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi2"] = "Vui lòng điền tên đăng nhập";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi3"] = "Vui lòng nhập mật khẩu";
            }
            else if (String.IsNullOrEmpty(matkhaunhaplai))
            {
                ViewData["Loi4"] = "Vui lòng điền lại mật khẩu";
            }


            if (String.IsNullOrEmpty(email))
            {
                ViewData["Loi5"] = "Email không được bỏ trống";
            }

            if (String.IsNullOrEmpty(dienthoai))
            {
                ViewData["Loi6"] = "Vui lòng điền số điện thoai";
            }
            else
            {
                //Gán giá trị cho đối tượng được tạo mới (kh)

                kh.HOTENKH = hoten;
                kh.TENDNKH = tendn;
                kh.MATKHAUKH = matkhau;
                kh.EMAIL = email;
                kh.DIACHI = diachi;
                kh.DIENTHOAI = dienthoai;
                kh.HINHANH = hinhanh;
                kh.NGAYSINH = DateTime.Parse(ngaysinh);
                data.KHACHHANGs.InsertOnSubmit(kh);
                data.SubmitChanges();
                return RedirectToAction("dangnhap");
            }
            return this.dangky();
        }
        [HttpGet]
        public ActionResult dangnhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult dangnhap(FormCollection collection)
        {
            // Gán các giá trị người dùng nhập liệu cho các biến 
            var tendn = collection["TenDN"];
            var matkhau = collection["Matkhau"];
            if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi1"] = "Vui lòng điền tên đăng nhập";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi2"] = "Vui lòng nhập mật khẩu";
            }
            else
            {
                //Gán giá trị cho đối tượng được tạo mới (kh)

                KHACHHANG kh = data.KHACHHANGs.SingleOrDefault(n => n.TENDNKH == tendn && n.MATKHAUKH == matkhau);
                if (kh != null)
                {
                    // ViewBag.Thongbao = "Chúc mừng đăng nhập thành công";
                    Session["Taikhoan"] = kh;
                    return RedirectToAction("index", "User");
                }
                else
                    ViewBag.Thongbao = "Tên đăng nhập hoặc mật khẩu không đúng";
            }
            return View();
        }
    }
}