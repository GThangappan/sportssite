using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MongoDB.Bson;
namespace fics.Models
{
    public class profile
    {
        //public ObjectId _id { get; set; }
        //public int ID { get; set; }
        public string userName { get; set; }
        public string email { get; set; }
        public string companyName { get; set; }
        public string licenceNo { get; set; }
        public string address { get; set; }
        public BsonArray products { get; set; }
    }
}