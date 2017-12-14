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
    public class UserController : Controller
    {
       
        //
        // GET: /User/
        
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
        public ActionResult PostProduct() 
        {
            return View();
        }
        public ActionResult ViewProduct(){
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
            MongoCollection<BsonDocument> userDetails = db.GetCollection<BsonDocument>("users");
            MongoCollection<BsonDocument> cmpnyDetails = db.GetCollection<BsonDocument>("cmpdets");
            var document = new BsonDocument
            {
                {"companyName",""},
                {"address",""},
                {"licno",""},
                {"user",um.userName},
                {"email",um.email}
            };
            userDetails.Insert(um);
            cmpnyDetails.Insert(document);
            return View();
        }
        [HttpGet]
        public JsonResult  myres(string name,string pas)
        {
            var mongoClient = new MongoClient("Server=localhost:27017");
            var mongoServer = mongoClient.GetServer();
            var db = mongoServer.GetDatabase("ficsDb");
            var collection = db.GetCollection<BsonDocument>("users");
            var query = new QueryDocument("userName",name);
            String s = "";
            int count = 0;
            foreach (BsonDocument item in collection.Find(query))
            {
                BsonElement username = item.GetElement("userName");
                BsonElement password = item.GetElement("password");
                String uname = username.Value.ToString();
                String pass = password.Value.ToString();
                if (uname.Equals(name)&&pass.Equals(pas))
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
            var collection = db.GetCollection<BsonDocument>("users");
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

        public ActionResult mp()
        {
            return View();
        }

        public ActionResult dsboard()
        {
            return View();
        }

        public ActionResult Profile()
        {
            var mongoClient = new MongoClient("Server=localhost:27017");
            var mongoServer = mongoClient.GetServer();
            var db = mongoServer.GetDatabase("ficsDb");
            var collection2 = db.GetCollection<BsonDocument>("cmpdets");
            String name=Session["user"].ToString();
            var query2 = new QueryDocument("user", name);
            BsonDocument cmpvals = collection2.FindOne(query2);
            profile pr = new profile();
            pr.userName = cmpvals.GetElement("user").Value.ToString();
            pr.email = cmpvals.GetElement("email").Value.ToString();
            pr.companyName = cmpvals.GetElement("companyName").Value.ToString();
            pr.address=cmpvals.GetElement("address").Value.ToString();
            pr.licenceNo = cmpvals.GetElement("licno").Value.ToString();
            return View(pr);
        }

        [HttpPost]
        public String updateProfile(String companyName, String licno, String address)
        {
            var mongoClient = new MongoClient("Server=localhost:27017");
            var mongoServer = mongoClient.GetServer();
            var db = mongoServer.GetDatabase("ficsDb");
            String uname = Session["user"].ToString();
            var collection = db.GetCollection<BsonDocument>("cmpdets");
            var query = new QueryDocument("user", uname);
            BsonDocument cmpvals = collection.FindOne(query);
            var quer = Query.EQ("user", uname);
            profile pr = new profile();
            pr.email = cmpvals.GetElement("email").Value.ToString();
            var update = Update.Set("user", uname).Set("email", pr.email).Set("companyName", companyName).Set("address", address).Set("licno",licno);
            collection.Update(quer, update);
            return "success";
        }
        [HttpGet]
        public String postpro(String pName, String lNumber, String cNumber, String port, String dDate, String aDate, String pInfo) {
            var mongoClient = new MongoClient("Server=localhost:27017");
            var mongoServer = mongoClient.GetServer();
            var db = mongoServer.GetDatabase("ficsDb");
            String uname = Session["user"].ToString();
            MongoCollection<BsonDocument> productDetails = db.GetCollection<BsonDocument>("products");
            var collection2 = db.GetCollection<BsonDocument>("cmpdets");
            var query2 = new QueryDocument("user", uname);
            BsonDocument cmpvals = collection2.FindOne(query2);
            var document = new BsonDocument
            {
                {"company",cmpvals.GetElement("companyName").Value.ToString()},
                {"Licence",cmpvals.GetElement("licno").Value.ToString()},
                {"Address",cmpvals.GetElement("address").Value.ToString()},                
                {"uname",uname},
                {"pName",pName},
                {"lNumber",lNumber},
                {"cNumber",cNumber},
                {"port",port},
                {"dDate",dDate},
                {"aDate",aDate},
                {"pInfo",pInfo},
                {"InsDate","Null"},
                {"Status","Pending"},
                {"Report","Null"}
            };
                productDetails.Insert(document);
                return "success";            
        }
    }
}
