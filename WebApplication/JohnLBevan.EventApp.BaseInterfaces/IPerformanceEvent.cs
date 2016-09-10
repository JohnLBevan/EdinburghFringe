using System;
using JohnLBevan.Common.Type;

namespace JohnLBevan.EventApp.BaseInterfaces
{

    public interface IPerformanceEvent
    {
        DateTime? EndTime { get; set; }
        DateOnly? EventDate { get; set; }
        long? Id { get; set; }
        long? PerformanceId { get; set; }
        DateTime? StartTime { get; set; }
        long? VenueId { get; set; }
    }

}