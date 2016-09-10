using System;

namespace JohnLBevan.Common.Type
{
    public struct DateOnly: IComparable
    {
        DateTime underlyingValue;

        public DateOnly(DateTime dateTime)
        {
            underlyingValue = dateTime.Date;
        }
        public DateOnly(DateOnly dateOnly)
        {
            underlyingValue = dateOnly.underlyingValue;
        }

        #region IComparable
        public int CompareTo(DateOnly obj)
        {
            return CompareTo(obj.underlyingValue);
        }
        public int CompareTo(DateTime obj)
        {
            return underlyingValue.CompareTo((new DateOnly(obj).underlyingValue));
        }
        public int CompareTo(object obj)
        {
            DateOnly? objConverted = obj as DateOnly?;
            if (objConverted.HasValue)
            {
                return CompareTo(objConverted.Value);
            }
            else
            {
                return 1;
            }
        }
        #endregion IComparable
    }
}
