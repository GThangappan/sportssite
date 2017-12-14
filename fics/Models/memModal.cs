using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MongoDB.Bson;
namespace fics.Models
{
    public class memModal
    {
        public ObjectId _id { get; set; }
        public string userName { get; set; }
        public string email { get; set; }
        public string teamtype { get; set; }
        public string sporttype { get; set; }
        public string teamname { get; set; }
        public string teamsite { get; set; }
        public string teamsocial { get; set; }
        public string teamcountry { get; set; }
        public string teamaddress { get; set; }
        public string p_name { get; set; }
        public string p_email { get; set; }
        public string p_mobile { get; set; }
    }
}