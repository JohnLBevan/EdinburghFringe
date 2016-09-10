using System;
using JohnLBevan.Common.Type;
using JohnLBevan.EventApp.BaseInterfaces;

namespace JohnLBevan.EventApp.DTO
{

    public class PerformanceEventDTO : DTOBase, IPerformanceEvent
    {
        public DateTime? EndTime { get; set; }
        public DateOnly? EventDate { get; set; }
        public long? Id { get; set; }
        public long? PerformanceId { get; set; }
        public DateTime? StartTime { get; set; }
        public long? VenueId { get; set; }

        public PerformanceEventDTO()
        {
            IsNew = true;
            EndTime = default(DateTime?);
            EventDate = default(DateOnly?);
            Id = default(long?);
            PerformanceId = default(long?);
            StartTime = default(DateTime?);
            VenueId = default(long?);
        }

        public PerformanceEventDTO(DateTime? endTime, DateOnly? eventDate, long? id, long? performanceId, DateTime? startTime, long? venueId, bool isNew = false)
        {
            IsNew = isNew;
            EndTime = endTime;
            EventDate = eventDate;
            Id = id;
            PerformanceId = performanceId;
            StartTime = startTime;
            VenueId = venueId;
        }
    }

}