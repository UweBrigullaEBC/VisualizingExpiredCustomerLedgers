codeunit 50100 ThresholdSetupManagement
{
    procedure RunThresholdSetup(var ThresholdSetupNotification: Notification)
    var
        ThresholdSetup: page ThresholdSetup;
    begin
        ThresholdSetup.RunModal();
    end;
}
