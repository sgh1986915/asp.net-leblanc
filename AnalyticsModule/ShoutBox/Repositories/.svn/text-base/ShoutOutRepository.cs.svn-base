using System;
using System.Collections.Generic;
using System.Linq;
using RobustHaven.Areas.ShoutBox.Models;

namespace RobustHaven.Areas.ShoutBox.Repositories
{
    public class ShoutOutRepository : IShoutOutRepository
    {
        private readonly string _connectionString;

        public ShoutOutRepository(string connectionString)
        {
            _connectionString = connectionString;
        }

        public IEnumerable<Shout> List(int limit, int offset)
        {
            var shouts = new List<Shout>();
            using (var context = new TradingViewsEntities(_connectionString))
            {
                var query = context.ShoutBoxes.OrderByDescending(s => s.createdon).Skip(offset).Take(limit);
                shouts.AddRange(query.Select(shoutBox => new Shout()
                    {
                        Id = shoutBox.id,
                        CreatedOn =
                            shoutBox.createdon,
                        Message = shoutBox.message,
                        UserName = shoutBox.username
                    }));
            }
            return shouts;
        }

        public void Create(Shout shout)
        {
            using (var context = new TradingViewsEntities(_connectionString))
            {
                context.ShoutBoxes.AddObject(new ShoutBox()
                {
                    id = Guid.NewGuid(),
                    username = "Anonymous",
                    message = shout.Message,
                    createdon = DateTime.UtcNow
                });
                context.SaveChanges();
            }
        }
    }
}