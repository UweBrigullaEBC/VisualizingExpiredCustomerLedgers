pageextension 50140 CustomerLedgerEnriesEXT extends "Customer Ledger Entries"
{
    layout
    {
        addfirst(content)
        {
            field(NumberOfDaysExpired; Rec.GetNumberOfDaysExpired())
            {
                ApplicationArea = All;
                Editable = false;
                Caption = 'Number of Days Expired';
                ToolTip = 'The number of days this entry is expired, based upon Due Date and today.';
                StyleExpr = DaysExpiredStyle;
            }
        }
    }

    views
    {
        addfirst
        {
            view("Open Entries")
            {
                Caption = 'Open Entries';
                OrderBy = ascending("Due Date");
                Filters = where(Open = const(true));
                SharedLayout = false;

                layout
                {
                    movefirst(Control1; NumberOfDaysExpired)
                    moveafter(NumberOfDaysExpired; "Due Date")
                }
            }
        }
    }

    var
        NumberOfDaysExpired: Integer;
        DaysExpiredStyle: Text;
        ThresholdSetup: Record ThresholdSetup;
        NumberOfDaysExpiredLabel: Label 'Number of Days Expired';

    trigger OnOpenPage()
    begin
        if not ThresholdSetup.Get() then begin
            ShowThresholdSetupNotification();
            CurrPage.Update();
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        NumberOfDaysExpired := rec.GetNumberOfDaysExpired();
        case NumberOfDaysExpired of
            ThresholdSetup.Threshold1Value .. ThresholdSetup.Threshold2Value:
                DaysExpiredStyle := format(ThresholdSetup.Threshold1Style);
            ThresholdSetup.Threshold2Value .. 99999:
                DaysExpiredStyle := format(ThresholdSetup.Threshold2Style);
            else
                DaysExpiredStyle := 'None';
        end;
    end;

    procedure ShowThresholdSetupNotification()
    var
        ThresholdSetupNotification: Notification;
        msg: Label 'You need to run the Threshold Setup: ', Comment = 'de-DE=Sie müssen Threshold Setup ausführen';
        actionCaption: Label 'Click here to run the ThresholdSetup', Comment = 'de-DE=Hier klicken um Threshold Setup auszuführen';
    begin
        ThresholdSetupNotification.Message(msg);
        ThresholdSetupNotification.AddAction(actionCaption, Codeunit::ThresholdSetupManagement, 'RunThresholdSetup');
        ThresholdSetupNotification.Send();
    end;
}
