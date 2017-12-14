using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MongoDB.Bson;
using MongoDB.Driver;
namespace fics.Models
{
    public class productDetails
    {
        public ObjectId id{set; get;}
        public String user{set;get;}
        public String product { set; get; }
        public String company { set; get; }
        public String productlicense { set; get; }
        public String comapanylicense { set; get; }
        public String port { set; get; }
        public String cargo { set; get; }
        public String departuredate { set; get; }
        public String arivaldate { set; get; }
        public String inspection { set; get; }
        public String status { set; get; }
        public String report { set; get; }
        public String productInfo { set; get; }
        public String address { set; get; }

    }
}