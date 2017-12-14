using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MongoDB.Bson;
namespace fics.Models
{
    public class gameModal
    {
        public ObjectId _id { get; set; }
        public String hostedBy { get; set; }
        public String eventName { get; set; }
        public String country { get; set; }
        public String state { get; set; }
        public String city { get; set; }
        public String location { get; set; }
        public String time { get; set; }
        public String from { get; set; }
        public String to { get; set; }
        public String lastdate { get; set; }
        public String category { get; set; }
        public String priceDets { get; set; }
        public String no_of_rounds { get; set; }
        public String currentDets { get; set; }
        public String ratings { get; set; }
        public String aboutGame { get; set; }
        public String publishedBy { get; set; }
        public String website { get; set; }
        public String email { get; set; }
        public String mobile { get; set; }
        public String minNumberPlayer { get; set; }
        public String maxNumberPlayer { get; set; }
    }
}