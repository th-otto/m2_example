IMPLEMENTATION MODULE AppBase;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)



PROCEDURE updateWindow();
BEGIN
END updateWindow;


BEGIN
  doUpdateWindow := updateWindow;
  apId := -1;
  vdiHandle := -1;
  wdwHandle := -1;
  openFiles := FileSet{};
  openStreams := StreamSet{};
  shellTail[0] := 0C;
END AppBase.
