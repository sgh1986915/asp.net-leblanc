using System.Collections.Generic;
using System.ServiceModel.Activation;
using RobustHaven.Areas.ShoutBox.Models;
using RobustHaven.Areas.ShoutBox.Repositories;

namespace RobustHaven.Areas.ShoutBox.Services
{
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Required)]
    public class ShoutOutService : IShoutOutService
    {
        private readonly IShoutOutRepository _shoutOutRepository;

        public ShoutOutService(IShoutOutRepository shoutOutRepository)
        {
            _shoutOutRepository = shoutOutRepository;
        }

        public IEnumerable<Shout> List()
        {
            return _shoutOutRepository.List(10, 0);
        }


        public void Create(Shout shout)
        {
            _shoutOutRepository.Create(shout);
        }
    }
}