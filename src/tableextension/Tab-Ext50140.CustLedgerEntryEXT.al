tableextension 50140 CustLedgerEntryEXT extends "Cust. Ledger Entry"
{
    procedure GetNumberOfDaysExpired() numberOfDays: Integer
    begin
        if today() > "Due Date" then numberOfDays := today() - "Due Date";
    end;
}
