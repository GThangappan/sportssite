using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MongoDB.Bson;
namespace fics.Models
{
    public class UserModal
    {
        public ObjectId _id { get; set; }
        //public int ID { get; set; }
        public string userName { get; set; }
        public string password { get; set; }
        public string email { get; set; }        
    }
}