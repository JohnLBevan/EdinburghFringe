using System;
using JohnLBevan.Common.Type;
using JohnLBevan.EventApp.BaseInterfaces;

namespace JohnLBevan.EventApp.DTO
{
    public abstract class DTOBase 
    {
        /// <summary>
        /// Is this fresh or recorded data?
        /// - false if pulled from persisted data
        /// - true if created during operation
        /// </summary>
        public bool IsNew { get; set; }
    }
}
