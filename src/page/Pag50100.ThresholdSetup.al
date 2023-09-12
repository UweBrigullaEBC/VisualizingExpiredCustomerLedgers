page 50100 ThresholdSetup
{
    ApplicationArea = All;
    Caption = 'Threshold Setup';
    PageType = Card;
    SourceTable = ThresholdSetup;
    UsageCategory = Administration;
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(Threshold1Style; Rec.Threshold1Style)
                {
                    ToolTip = 'Specifies the value of the Threshold 1 Style field.';
                    ApplicationArea = All;
                }
                field(Threshold1Value; Rec.Threshold1Value)
                {
                    ToolTip = 'Specifies the value of the Threshold 1 Value field.';
                    ApplicationArea = All;
                }
                field(Threshold2Style; Rec.Threshold2Style)
                {
                    ToolTip = 'Specifies the value of the Threshold 2 Style field.';
                    ApplicationArea = All;
                }
                field(Threshold2Value; Rec.Threshold2Value)
                {
                    ToolTip = 'Specifies the value of the Threshold 2 Value field.';
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.Get() then begin
            Rec.Init();
            Rec.insert();
        end;
    end;
}
