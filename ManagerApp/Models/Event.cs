using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace ManagerApp.Models
{
    [Table("event")]
    public class Event
    {
        [Key]
        public int EventId { get; set; }

        [Required]
        [MaxLength(100)]
        public string EventName { get; set; }

        [Required]
        public DateTime EventDate { get; set; }

        [MaxLength(500)]
        public string Description { get; set; }

        [ForeignKey("venue")]
        public int VenueId { get; set; }

        public Venue? Venue { get; set; }
        public List<Booking> Bookings { get; set; } = new List<Booking>();
    }
}
