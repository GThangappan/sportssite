using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MongoDB.Bson;
using MongoDB.Driver;
namespace fics.Models
{
    public class productModal
    {
        public MongoCollection<BsonDocument> procolect { get; set; }
    }
}