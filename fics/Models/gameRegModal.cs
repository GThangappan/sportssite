using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MongoDB.Bson;
using MongoDB.Driver;
namespace fics.Models
{
    public class gameRegModal
    {
        public String gameid { get; set; }
        public String regby { get; set; }
        public String feeback { get; set; }
        public String rating { get; set; }
        public String status { get; set; }
        public BsonArray players { get; set; }
        public String query { get; set; }
        public String ans { get; set; }
    }
}