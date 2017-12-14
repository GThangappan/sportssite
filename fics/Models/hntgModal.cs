using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MongoDB.Bson;
using MongoDB.Driver;
namespace fics.Models
{
    public class hntgModal
    {
        public MongoCollection<BsonDocument> games { get; set; }
        public MongoCollection<BsonDocument> teams { get; set; }
    }
}