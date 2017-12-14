using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using fics.Models;
using MongoDB.Bson;
using MongoDB.Driver;
using MongoDB.Driver.Linq;
using MongoDB.Driver.Builders;
using MongoDB.Driver.GridFS;

namespace fics.Controllers
{
    public class sUserController : Controller
    {
        //
        // GET: /sUser/


        public ActionResult Login()
        {
            return View();
        }

        public ActionResult Registration()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(UserModal um)
        {

            var mongoClient = new MongoClient("Server=localhost:27017");
            var mongoServer = mongoClient.GetServer();
            var db = mongoServer.GetDatabase("hntsprt");
            MongoCollection<BsonDocument> userDetails = db.GetCollection<BsonDocument>("users");
            MongoCollection<BsonDocument> ProfileDetails = db.GetCollection<BsonDocument>("profiledets");
            MongoCollection<BsonDocument> memdets = db.GetCollection<BsonDocument>("memdets");
            profileModal pr = new profileModal();
            memModal tm = new memModal();
            pr.userName = um.userName;
            pr.email = um.email;
            tm.userName = um.userName;
            tm.email = um.email;
            userDetails.Insert(um);
            ProfileDetails.Insert(pr);
            memdets.Insert(tm);
            return View();
        }
        [HttpGet]
        public JsonResult myres(string name, string pas)
        {
            var mongoClient = new MongoClient("Server=localhost:27017");
            var mongoServer = mongoClient.GetServer();
            var db = mongoServer.GetDatabase("hntsprt");
            var collection = db.GetCollection<BsonDocument>("users");
            var query = new QueryDocument("userName", name);
            String s = "";
            int count = 0;
            String email="";
            foreach (BsonDocument item in collection.Find(query))
            {
                BsonElement username = item.GetElement("userName");
                BsonElement password = item.GetElement("password");
                BsonElement temail    = item.GetElement("email");
                String uname = username.Value.ToString();
                String pass = password.Value.ToString();
                if (uname.Equals(name) && pass.Equals(pas))
                {
                    email=temail.Value.ToString();
                    count++;
                }
            }
            if (count > 0)
            {
                s = "Success";
                Session["user"] = name;
                Session["email"] = email;
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
            var db = mongoServer.GetDatabase("hntsprt");
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
        public ActionResult dsboard()
        {
            return View();
        }
        public ActionResult publicprofile()
        {
            var mongoClient = new MongoClient("Server=localhost:27017");
            var mongoServer = mongoClient.GetServer();
            var db = mongoServer.GetDatabase("hntsprt");
            var collection2 = db.GetCollection<BsonDocument>("profiledets");
            String name = Session["user"].ToString();
            var query1 = new QueryDocument("userName", name);
            BsonDocument prod = collection2.FindOne(query1);
            profileModal pr = new profileModal();
            pr.userName = prod.GetElement("userName").Value.ToString();
            pr.email = prod.GetElement("email").Value.ToString();
            pr.full_name = prod.GetElement("full_name").Value.ToString();
            pr.country = prod.GetElement("country").Value.ToString();
            pr.address = prod.GetElement("address").Value.ToString();
            pr.mobile_number = prod.GetElement("mobile_number").Value.ToString();
            pr.p_social_link = prod.GetElement("p_social_link").Value.ToString();
            pr.p_website_link = prod.GetElement("p_website_link").Value.ToString();
            pr.aboutYou = prod.GetElement("aboutYou").Value.ToString();
            return View(pr);
        }
        [HttpPost]
        public String updateProfile(String full_name, String country, String address, String mobilenumber,String p_social_link,String p_website_link,String aboutYou)
        {
            var mongoClient = new MongoClient("Server=localhost:27017");
            var mongoServer = mongoClient.GetServer();
            var db = mongoServer.GetDatabase("hntsprt");
            var collection = db.GetCollection<BsonDocument>("profiledets");
            String uname = Session["user"].ToString();
            var t=collection.Exists();
            var query = new QueryDocument("userName", uname);
            BsonDocument entity = collection.FindOne(query);
            var quer = Query.EQ("userName", uname);
            var update = Update.Set("full_name", full_name)
                        .Set("country", country)
                        .Set("address", address)
                        .Set("mobile_number", mobilenumber)
                        .Set("p_social_link", p_social_link)
                        .Set("p_website_link", p_website_link)
                        .Set("aboutYou", aboutYou);
            collection.Update(quer, update);
            return "success";
        }
        
        public ActionResult addClub(){
            var mongoClient = new MongoClient("Server=localhost:27017");
            var mongoServer = mongoClient.GetServer();
            var db = mongoServer.GetDatabase("hntsprt");
            MongoCollection<BsonDocument> collection2 = db.GetCollection<BsonDocument>("gamedets");
            String name = Session["user"].ToString();
            var query1 = new QueryDocument("userName", name);
            BsonDocument prod = collection2.FindOne(query1);
            prod.Count();
            teamModal tm = new teamModal();
            
            return View();
        }
        public ActionResult hostGame() {
            var mongoClient = new MongoClient("Server=localhost:27017");
            var mongoServer = mongoClient.GetServer();
            var db = mongoServer.GetDatabase("hntsprt");
            var collection2 = db.GetCollection<BsonDocument>("memdets");
            String name = Session["user"].ToString();
            var query1 = new QueryDocument("userName", name);
            BsonDocument prod = collection2.FindOne(query1);
            memModal tm = new memModal();
            tm.userName = prod.GetElement("userName").Value.ToString();
            tm.email = prod.GetElement("email").Value.ToString();
            tm.teamtype = prod.GetElement("teamtype").Value.ToString();
            tm.sporttype = prod.GetElement("sporttype").Value.ToString();
            tm.teamname = prod.GetElement("teamname").Value.ToString();
            tm.teamsite = prod.GetElement("teamsite").Value.ToString();
            tm.teamsocial = prod.GetElement("teamsocial").Value.ToString();
            tm.teamcountry = prod.GetElement("teamcountry").Value.ToString();
            tm.p_name = prod.GetElement("p_name").Value.ToString();
            tm.p_email = prod.GetElement("p_email").Value.ToString();
            tm.p_mobile = prod.GetElement("p_mobile").Value.ToString();
            return View(tm);
        }
        public ActionResult membership()
        {
            var mongoClient = new MongoClient("Server=localhost:27017");
            var mongoServer = mongoClient.GetServer();
            var db = mongoServer.GetDatabase("hntsprt");
            var collection2 = db.GetCollection<BsonDocument>("memdets");
            String name = Session["user"].ToString();
            var query1 = new QueryDocument("userName", name);
            BsonDocument prod = collection2.FindOne(query1);
            memModal tm = new memModal();
            tm.userName = prod.GetElement("userName").Value.ToString();
            tm.email = prod.GetElement("email").Value.ToString();
            tm.teamtype = prod.GetElement("teamtype").Value.ToString();
            tm.sporttype = prod.GetElement("sporttype").Value.ToString();
            tm.teamname = prod.GetElement("teamname").Value.ToString();
            tm.teamsite = prod.GetElement("teamsite").Value.ToString();
            tm.teamsocial = prod.GetElement("teamsocial").Value.ToString();
            tm.teamcountry = prod.GetElement("teamcountry").Value.ToString();
            tm.p_name = prod.GetElement("p_name").Value.ToString();
            tm.p_email = prod.GetElement("p_email").Value.ToString();
            tm.p_mobile = prod.GetElement("p_mobile").Value.ToString();            
            return View(tm);
        }
        [HttpPost]
        public String updateGame(String hby,String sport,String country,String state,String city,String location,String from,String to,String time,String category,String price_dets,String minPlayer,String maxPlayer,String aboutgame,String lastdate)
        {
            var mongoClient = new MongoClient("Server=localhost:27017");
            var mongoServer = mongoClient.GetServer();
            var db = mongoServer.GetDatabase("hntsprt");
            MongoCollection<BsonDocument> memdets = db.GetCollection<BsonDocument>("gamedets");
            gameModal gm = new gameModal();
            gm.eventName = sport;
            gm.country = country;
            gm.state = state;
            gm.city = city;
            gm.location = location;
            gm.from = from;
            gm.to = to;
            gm.lastdate = lastdate;
            gm.time = time;
            gm.category = category;
            gm.priceDets = price_dets;
            gm.publishedBy = Session["user"].ToString();
            gm.minNumberPlayer = minPlayer;
            gm.maxNumberPlayer = maxPlayer;
            gm.aboutGame = aboutgame;
            if (hby.Equals("me"))
            {
                var collection2 = db.GetCollection<BsonDocument>("profiledets");
                String name = Session["user"].ToString();
                var query1 = new QueryDocument("userName", name);
                BsonDocument prod = collection2.FindOne(query1);
                gm.hostedBy = prod.GetElement("full_name").Value.ToString();
                gm.website = prod.GetElement("p_social_link").Value.ToString();
                gm.email = prod.GetElement("email").Value.ToString();
                gm.mobile = prod.GetElement("mobile_number").Value.ToString();
            }
            if (hby.Equals("club"))
            {
                var collection2 = db.GetCollection<BsonDocument>("memdets");
                String name = Session["user"].ToString();
                var query1 = new QueryDocument("userName", name);
                BsonDocument prod = collection2.FindOne(query1);
                gm.hostedBy = prod.GetElement("teamname").Value.ToString();
                gm.website = prod.GetElement("teamsite").Value.ToString();
                gm.email = prod.GetElement("p_email").Value.ToString();
                gm.mobile = prod.GetElement("p_mobile").Value.ToString();
            }
            memdets.Insert(gm);
            return "Success";

        }
        [HttpPost]
        public String updateMembership(String type,String club_name,String sport_name,String country,String address,String website,String social_link,String mval,String manager_name,String manager_email,String manager_mobile)
        {
            var mongoClient = new MongoClient("Server=localhost:27017");
            var mongoServer = mongoClient.GetServer();
            var db = mongoServer.GetDatabase("hntsprt");
            var collection1 = db.GetCollection<BsonDocument>("profiledets");
            var collection = db.GetCollection<BsonDocument>("memdets");
            String uname = Session["user"].ToString();            
            var query = new QueryDocument("userName", uname);
            BsonDocument entity1 = collection.FindOne(query);            
            BsonDocument entity2 = collection1.FindOne(query);            
            var quer = Query.EQ("userName", uname);
            if (mval.Equals("true"))
            {
                manager_name = entity2.GetElement("full_name").Value.ToString();
                manager_mobile = entity2.GetElement("mobile_number").Value.ToString();
                manager_email = entity2.GetElement("email").Value.ToString();
            }
            var update = Update.Set("teamtype", type)
                    .Set("sporttype", sport_name)
                    .Set("teamname", club_name)
                    .Set("teamsite", website)
                    .Set("teamsocial", social_link)
                    .Set("teamcountry", country)
                    .Set("teamaddress", address)
                    .Set("p_name", manager_name)
                    .Set("p_email", manager_email)
                    .Set("p_mobile", manager_mobile);
            collection.Update(quer, update);                
            return "success";
        }
        public ActionResult huntGames()
        {
            var mongoClient = new MongoClient("Server=localhost:27017");
            var mongoServer = mongoClient.GetServer();
            var db = mongoServer.GetDatabase("hntsprt");
            MongoCollection<BsonDocument> products = db.GetCollection<BsonDocument>("gamedets");
            hntgModal hm = new hntgModal();
            hm.games = products;
            return View(hm);
        }
        [HttpGet]
        public String addParticipant(String[] name, String[] age,String gid,String query)
        {
            var mongoClient = new MongoClient("Server=localhost:27017");
            var mongoServer = mongoClient.GetServer();
            var db = mongoServer.GetDatabase("hntsprt");
            MongoCollection<BsonDocument> products = db.GetCollection<BsonDocument>("regdets");
            MongoCollection<BsonDocument> gamedets = db.GetCollection<BsonDocument>("gamedets");
            var quer = Query.EQ("_id", new ObjectId(gid));
            var myco = gamedets.FindOne(quer);
            int minpla = myco.GetElement("minNumberPlayer").Value.ToInt32();
            int maxpla = myco.GetElement("maxNumberPlayer").Value.ToInt32();
            String category = myco.GetElement("category").Value.ToString();
            if(name.Length<minpla||name.Length>maxpla){
                return "Exceed Number of Players or Small Number of Player";
            }
            if (category.Equals("under-14"))
            {
                for (int i = 0; i < age.Length;i++ )
                {
                    int a=Convert.ToInt32(age[i]);
                    if (a > 14 || a < 8)
                    {
                        return "Age is Not Provided As per Category";
                    }
                }
            }
            if (category.Equals("under-20"))
            {
                for (int i = 0; i < age.Length; i++)
                {
                    int a = Convert.ToInt32(age[i]);
                    if (a > 20 || a < 15)
                    {
                        return "Age is Not Provided As per Category";
                    }
                }
            }
            if (category.Equals("open") || category.Equals("special"))
            {
                for (int i = 0; i < age.Length; i++)
                {
                    int a = Convert.ToInt32(age[i]);
                    if (a < 8)
                    {
                        return "Age is Not Provided As per Category";
                    }
                }
            }
            gameRegModal gm = new gameRegModal();
            gm.gameid = gid;
            gm.regby = Session["user"].ToString();
            gm.status = "Applied";
            gm.query = query;
            gm.players=new BsonArray();            
            for (int i = 0; i < name.Length; i++)
            {
                var t = new BsonDocument
                {
                    {"name",name[i]},
                    {"age",age[i]}
                };
                gm.players.Add(t);
            }            
            products.Insert(gm);
            return "success";
        }
        [HttpGet]
        public String checkParticipant(String gid)
        {
            var mongoClient = new MongoClient("Server=localhost:27017");
            var mongoServer = mongoClient.GetServer();
            var db = mongoServer.GetDatabase("hntsprt");
            MongoCollection<BsonDocument> games = db.GetCollection<BsonDocument>("regdets");
            String name = Session["user"].ToString();
            var query1 = new QueryDocument("gameid", gid);
            int count=0;
            String s = " Received gid is "+gid+"- ";
            String status = "Not";
            foreach (BsonDocument item in games.Find(query1))
            {               
                String regby = item.GetElement("regby").Value.ToString();
                String gmid = item.GetElement("gameid").Value.ToString();
                status = item.GetElement("status").Value.ToString();
                if(name.Equals(regby)){
                    count++;
                }                
            }
            if (count == 0)
            {
                return "no";
            }
            return status;            
        }
        public ActionResult manageGame()
        {
            var mongoClient = new MongoClient("Server=localhost:27017");
            var mongoServer = mongoClient.GetServer();
            var db = mongoServer.GetDatabase("hntsprt");
            MongoCollection<BsonDocument> games = db.GetCollection<BsonDocument>("gamedets");
            MongoCollection<BsonDocument> teams = db.GetCollection<BsonDocument>("regdets");
            hntgModal hm = new hntgModal();
            hm.games = games;
            hm.teams = teams;
            return View(hm);
        }
        [HttpGet]
        public String editGameDets(String[] s)
        {
            var mongoClient = new MongoClient("Server=localhost:27017");
            var mongoServer = mongoClient.GetServer();
            var db = mongoServer.GetDatabase("hntsprt");
            var collection = db.GetCollection<BsonDocument>("gamedets");
            var t = collection.Exists();
            var query = new QueryDocument("_id", new ObjectId(s[0]));
            BsonDocument entity = collection.FindOne(query);
            var quer = Query.EQ("_id", new ObjectId(s[0]));
            var update = Update.Set("eventName", s[1])
                        .Set("country", s[2])
                        .Set("state", s[3])
                        .Set("city", s[4])
                        .Set("location", s[5])
                        .Set("from", s[6])
                        .Set("to", s[7])
                        .Set("time", s[8])
                        .Set("category", s[9])
                        .Set("priceDets", s[10])
                        .Set("minPlayer",s[11])
                        .Set("maxPlayer", s[12])
                        .Set("lastdate",s[14])
                        .Set("aboutGame", s[13]);
            collection.Update(quer, update);
            return "success";
        }        
        [HttpPost]
        public String approval(String oid, String status, String msg)
        {
            var mongoClient = new MongoClient("Server=localhost:27017");
            var mongoServer = mongoClient.GetServer();
            var db = mongoServer.GetDatabase("hntsprt");
            var collection = db.GetCollection<BsonDocument>("regdets");
            var query = new QueryDocument("_id", new ObjectId(oid));
            var res = collection.FindOne(query);
            var update = Update.Set("status", status);
            var quer = Query.EQ("_id", new ObjectId(oid));
            collection.Update(quer, update);
            return "Successs";
        }
        [HttpPost]
        public String cancelReg(String oid)
        {
            var mongoClient = new MongoClient("Server=localhost:27017");
            var mongoServer = mongoClient.GetServer();
            var db = mongoServer.GetDatabase("hntsprt");
            var collection = db.GetCollection<BsonDocument>("regdets");
            String uname=Session["user"].ToString();
            var quer = Query.And(Query.EQ("gameid", oid),Query.EQ("regby", uname));
            var res = collection.FindOne(quer);
            collection.Remove(quer);
            return "removed";
        }
        [HttpPost]
        public String cancelEvent(String oid)
        {
            var mongoClient = new MongoClient("Server=localhost:27017");
            var mongoServer = mongoClient.GetServer();
            var db = mongoServer.GetDatabase("hntsprt");
            var collection1 = db.GetCollection<BsonDocument>("regdets");
            var collection2 = db.GetCollection<BsonDocument>("gamedets");
            var quer1 = Query.EQ("_id", new ObjectId(oid));
            var quer2 = Query.EQ("gameid", oid);
            collection2.Remove(quer1);
            collection1.Remove(quer2);
            return "Record Deleted Successfully";
        }
        [HttpPost]
        public String moreUserdets(String regby)
        {
            String s = "";
            var mongoClient = new MongoClient("Server=localhost:27017");
            var mongoServer = mongoClient.GetServer();
            var db = mongoServer.GetDatabase("hntsprt");
            var collection1 = db.GetCollection<BsonDocument>("profiledets");
            var collection2 = db.GetCollection<BsonDocument>("memdets");
            var query1 = Query.EQ("userName", regby);
            var profile = collection1.FindOne(query1);
            var memdets = collection2.FindOne(query1);
            String fullname=profile.GetElement("full_name").Value.ToString();
            String mobilenumber=profile.GetElement("mobile_number").Value.ToString();
            String sociallink=profile.GetElement("p_social_link").Value.ToString();
            String weblink=profile.GetElement("p_website_link").Value.ToString();
            String teamname=memdets.GetElement("teamname").Value.ToString();
            String teamtype=memdets.GetElement("teamtype").Value.ToString();
            String teamsport=memdets.GetElement("sporttype").Value.ToString();
            String teamsite=memdets.GetElement("teamsite").Value.ToString();
            String teamsocial=memdets.GetElement("teamsocial").Value.ToString();            
            s+= "<div class='panel panel-success col-lg-6'><div class='panel-heading'>User Details</div><div class='panel-body'><table class='table'><tr><td>Full Name</td>"+fullname+"</tr><tr><td>Mobile Number </td><td>"+mobilenumber+"</td></tr>";
            s += "<tr><td>Social Link</td><td><a href='"+sociallink+"' target='_blank'>"+sociallink+"</a></td>";
            s += "</table></div></div>";
            s += "<div class='panel panel-primary col-lg-6'><div class='panel-heading'>Membership Details</div><div class='panel-body'><table class='table'>";
            s += "<tr><td>Team Name</td><td>"+teamname+" "+teamtype+"</td><tr><td>Sport</td><td>"+teamsport+"</td></tr>";
            s += "<tr><td>Website</td><a href='" + teamsite + "' target='_blank'>" + teamsite + "</a><td></td></tr>";
            s += "<tr><td>Social Link</td><td><a href='" + teamsocial + "' target='_blank'>" + teamsocial + "</a></td></tr>";
            s += "</table></div></div>";
            return s;
        }
        [HttpPost]
        public String playerdetails(String oid)
        {
            String s = "";
            return s;
        }
    }
}
