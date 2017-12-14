using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MongoDB.Bson;
namespace fics.Models
{
    public class hntprofile
    {
        public ObjectId _id { get; set; }
        public string username { get; set; }
        public string email { get; set; }
        public string name { get; set; }
        public string nickname { get; set; }
        public string country { get; set; }
        public string mobilenumber { get; set; }
    }
}