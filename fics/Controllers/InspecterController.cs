using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using fics.Models;
using MongoDB.Driver;
using MongoDB.Driver.Linq;
using MongoDB.Driver.Builders;
using MongoDB.Bson;

namespace fics.Controllers
{
    public class InspecterController : Controller
    {
       
        //
        // GET: /Inspecter/
        public ActionResult Registration()
        {
            return View();
        }
        public ActionResult Loginin()
        {
            return View();
        }
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult editApproval()
        {
            String lno = Session["license"].ToString();
            var mongoClient = new MongoClient("Server=localhost:27017");
            var mongoServer = mongoClient.GetServer();
            var db = mongoServer.GetDatabase("ficsDb");
            var collection2 = db.GetCollection<BsonDocument>("products");
            var query2 = new QueryDocument("lNumber", lno);
            BsonDocument products = collection2.FindOne(query2);
            productDetails pd = new productDetails();
            pd.company = products.GetElement("company").Value.ToString();
            pd.comapanylicense = products.GetElement("Licence").Value.ToString();
            pd.address = products.GetElement("Address").Value.ToString();
            pd.user = products.GetElement("uname").Value.ToString();
            pd.product = products.GetElement("pName").Value.ToString();
            pd.productlicense = products.GetElement("lNumber").Value.ToString();
            pd.productInfo = products.GetElement("pInfo").Value.ToString();
            pd.port = products.GetElement("port").Value.ToString();
            pd.cargo = products.GetElement("cNumber").Value.ToString();
            pd.departuredate = products.GetElement("dDate").Value.ToString();
            pd.arivaldate = products.GetElement("aDate").Value.ToString();
            pd.inspection = products.GetElement("InsDate").Value.ToString();
            pd.status = products.GetElement("Status").Value.ToString();
            pd.report = products.GetElement("Report").Value.ToString();            
            return View(pd);
        }
        public ActionResult setApproval() {
            return View();
        }
        public ActionResult ViewProducts() {
            var mongoClient = new MongoClient("Server=localhost:27017");
            var mongoServer = mongoClient.GetServer();
            var db = mongoServer.GetDatabase("ficsDb");
            MongoCollection<BsonDocument> products = db.GetCollection<BsonDocument>("products");
            productModal prmo = new productModal();
            prmo.procolect = products;
            
            return View(prmo);
        }
        [HttpPost]
        public ActionResult Register(UserModal um)
        {            
            var mongoClient = new MongoClient("Server=localhost:27017");
            var mongoServer = mongoClient.GetServer();
            var db = mongoServer.GetDatabase("ficsDb");
            MongoCollection<BsonDocument> userDetails = db.GetCollection<BsonDocument>("inspects");
            userDetails.Insert(um);
            return View();
        }
        [HttpGet]
        public JsonResult myres(string name, string pas)
        {
            var mongoClient = new MongoClient("Server=localhost:27017");
            var mongoServer = mongoClient.GetServer();
            var db = mongoServer.GetDatabase("ficsDb");
            var collection = db.GetCollection<BsonDocument>("inspects");
            var query = new QueryDocument("userName", name);
            String s = "";
            int count = 0;
            foreach (BsonDocument item in collection.Find(query))
            {
                BsonElement username = item.GetElement("userName");
                BsonElement password = item.GetElement("password");
                String uname = username.Value.ToString();
                String pass = password.Value.ToString();
                if (uname.Equals(name) && pass.Equals(pas))
                    count++;
            }
            if (count > 0)
            {
                s = "Success";
                Session["user"] = name;
            }
            else
                s = "Fail";
            if (name.Equals("") || pas.Equals(""))
                s = "Success";
            return Json(s, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult valCheck(string field, string val)
        {
            var mongoClient = new MongoClient("Server=localhost:27017");
            var mongoServer = mongoClient.GetServer();
            var db = mongoServer.GetDatabase("ficsDb");
            var collection = db.GetCollection<BsonDocument>("inspects");
            var query = new QueryDocument(field, val);
            String s = "";
            int count = 0;
            foreach (BsonDocument item in collection.Find(query))
            {
                BsonElement Field = item.GetElement(field);
                String value = Field.Value.ToString();
                if (value.Equals(val))
                    count++;
            }
            if (count > 0)
                s = "Success";
            else
                s = "Fail";
            if (field.Equals("") || val.Equals(""))
                s = "Success";
            return Json(s, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public String searchlno(string lno) {
            var mongoClient = new MongoClient("Server=localhost:27017");
            var mongoServer = mongoClient.GetServer();
            var db = mongoServer.GetDatabase("ficsDb");
            var collection2 = db.GetCollection<BsonDocument>("products");
            String name = Session["user"].ToString();
            var query2 = new QueryDocument("lNumber", lno);
            BsonDocument products = collection2.FindOne(query2);
            String resp = "";
            if (lno.Equals(products.GetElement("lNumber").Value.ToString()))
            {
                resp = products.GetElement("lNumber").Value.ToString();                
            }
            else
            {
                resp = "Null";
            }
            Session["license"] = resp;
            return resp;
        }
        [HttpGet]
        public String changeval(String company,String Licence,String Address,String uname,String pName,String lNumber,String cNumber,String port,String dDate,String aDate,String pInfo,String InsDate,String Status,String Report)
        {
            var mongoClient = new MongoClient("Server=localhost:27017");
            var mongoServer = mongoClient.GetServer();
            var db = mongoServer.GetDatabase("ficsDb");
            var collection = db.GetCollection<BsonDocument>("products");
            String lno = Session["license"].ToString();
            var quer = Query.EQ("lNumber", lno);
            var update = Update.Set("company", company).Set("Licence", Licence).Set("Address", Address).Set("uname", uname).Set("pName", pName).Set("lNumber", lNumber).Set("cNumber", cNumber).Set("port", port).Set("dDate", dDate).Set("aDate", aDate).Set("pInfo", pInfo).Set("InsDate", InsDate).Set("Report", Report);
            collection.Update(quer, update);
            return "success";
        }
    }
}
