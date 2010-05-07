using FluentNHibernate.Automapping;
using FluentNHibernate.Automapping.Alterations;
using UcdMvcBootCamp.Core.Domain;

namespace UcdMvcBootCamp.Core.Infrastructure.Maps
{
    public class ConferenceMappingOverride : IAutoMappingOverride<Conference>
    {
        public void Override(AutoMapping<Conference> mapping)
        {
            mapping.HasMany(x => x.Sessions).Cascade.AllDeleteOrphan();
            mapping.HasMany(x => x.Attendees).Cascade.AllDeleteOrphan();
        }
    }
}