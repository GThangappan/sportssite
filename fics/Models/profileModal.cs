using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MongoDB.Bson;
namespace fics.Models
{
    public class profileModal
    {
        /*logindetails*/
        public ObjectId _id { get; set; }
        //public int ID { get; set; }
        public string userName { get; set; }
        public string email { get; set; }
        
        /*public details*/
        public string full_name { get; set; }
        public string country { get; set; }
        public string address { get; set; }
        public string mobile_number{get; set;}
        public string p_social_link { get; set; }
        public string p_website_link { get; set; }
        public string aboutYou { get; set; }

        /*intrested in*/
        public string sport_1 { get; set; }
        public string sport_2 { get; set; }
        public string sport_3 { get; set; }

        /*club details*/        
        public string club_Name { get; set; }
        public string website { get; set; }
        public string social_Link { get; set; }
        public string club_mobile { get; set; }
    }
}