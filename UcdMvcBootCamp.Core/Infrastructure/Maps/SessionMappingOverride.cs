using FluentNHibernate.Automapping;
using FluentNHibernate.Automapping.Alterations;
using UcdMvcBootCamp.Core.Domain;

namespace UcdMvcBootCamp.Core.Infrastructure.Maps
{
    public class SessionMappingOverride : IAutoMappingOverride<Session>
    {
        public void Override(AutoMapping<Session> mapping)
        {
            mapping.References(x => x.Speaker).Cascade.SaveUpdate();
        }
    }
}