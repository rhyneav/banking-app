using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LoanCalculator
{
    public class clsLoanCalculator
    {
        private int myNumberOfMonths = 1;
        public int NumberOfMonths
        {
            get
            {
                return myNumberOfMonths;
            }
            set
            {
                if (value > 0)
                {
                    myNumberOfMonths = value;
                }
            }
        }
        private double myMonthlyInterestRate = 0;
        public double MonthlyInterestRate
        {
            get
            {
                return myMonthlyInterestRate;
            }
            set
            {
                if (value >= 0)
                {
                    myMonthlyInterestRate = value;
                }
            }
        }
        private double myPrincipal = 0;
        public double Principal
        {
            get
            {
                return myPrincipal;
            }
            set
            {
                if (value > 0)
                {
                    myPrincipal = value;
                }
            }
        }
        public int NumberOfYears
        {
            set
            {
                if (value > 0)
                {
                    myNumberOfMonths = value * 12;
                }
            }
        }
        public double APR 
        {
            get
            {
                return myMonthlyInterestRate * 12;
            }
            set
            {
                if (value >= 0)
                {
                    myMonthlyInterestRate = value / 12;
                }
            }

        }
        public double MonthlyPayment
        {
            get
            {
                double dblBottomPart = Math.Pow(1 + myMonthlyInterestRate, myNumberOfMonths) - 1;
                return (myMonthlyInterestRate + (myMonthlyInterestRate / dblBottomPart)) * myPrincipal;
            }
        }
        public AmotizationLine[] Schedule{
            get
            {
                return new AmortizationSchedule(NumberOfMonths, Principal,
                    MonthlyInterestRate, MonthlyPayment).Schedule;
            }
        }
    }
    public class AmotizationLine
    {
        public AmotizationLine(double BeginningPricipal, double MonthlyInterestRate, 
            double Payment, int CurrentMonth)
            //THis is a constructor function...it will build the line given the parameters
            //  that I want to givbe it
        {
            myintMonth = CurrentMonth;
            mydblInterestPaid = MonthlyInterestRate * BeginningPricipal;
            mydblPricipalPaid = Payment - mydblInterestPaid;
            mydblPrincipal = BeginningPricipal - mydblPricipalPaid;
        }
        private double mydblPrincipal = 0;
        public double Principal
        {
            get 
            {
                return mydblPrincipal;
            }
        }
        private double mydblInterestPaid = 0;
        public double InterestPaid
        {
            get
            {
                return mydblInterestPaid;
            }
        }
        private double mydblPricipalPaid = 0;
        public double PrincipalPaid
        {
            get
            {
                return mydblPricipalPaid;
            }
        }
        private int myintMonth = 0;
        public int Month
        {
            get
            {
                return myintMonth;
            }
        }
    }
    public class AmortizationSchedule
    {
        public AmortizationSchedule(int NumberOfMonths, double Principal, 
            double MonthlyInterestRate, double MonthlyPayment)
        {
            mySchedule = new AmotizationLine[NumberOfMonths];
            mySchedule[0] = new AmotizationLine(Principal, 0, 
                0, 0);
            for (int intMonth = 1; intMonth < NumberOfMonths; intMonth++)
            {
                mySchedule[intMonth] = new AmotizationLine(mySchedule[intMonth - 1].Principal,
                    MonthlyInterestRate, MonthlyPayment, intMonth);
            }
        }
        private AmotizationLine[] mySchedule;
        public AmotizationLine[] Schedule
        {
            get
            {
                return mySchedule;
            }
        }
    }
}
