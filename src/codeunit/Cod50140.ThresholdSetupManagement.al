codeunit 50140 ThresholdSetupManagement
{
    procedure RunThresholdSetup(var ThresholdSetupNotification: Notification)
    var
        ThresholdSetup: page ThresholdSetup;
    begin
        ThresholdSetup.RunModal();
    end;
}
