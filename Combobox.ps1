<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    Untitled
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

#region begin GUI{ 

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '400,400'
$Form.text                       = "Form"
$Form.TopMost                    = $false

$ComboBox1                       = New-Object system.Windows.Forms.ComboBox
$ComboBox1.text                  = "comboBox"
$ComboBox1.width                 = 187
$ComboBox1.height                = 50
$ComboBox1.location              = New-Object System.Drawing.Point(100,77)
$ComboBox1.Font                  = 'Microsoft Sans Serif,10'

$Button1                         = New-Object system.Windows.Forms.Button
$Button1.text                    = "Select"
$Button1.width                   = 165
$Button1.height                  = 81
$Button1.location                = New-Object System.Drawing.Point(101,209)
$Button1.Font                    = 'Microsoft Sans Serif,10'


##############   DropDown #################

$ComboBox1.DropDownStyle  = [System.Windows.Forms.ComboBoxStyle]::DropDown;
$countries = @(Get-content $PSScriptRoot\list.txt)
foreach($c in $countries){$ComboBox1.Items.add($c)}
$ComboBox1.SelectedIndex = 1


  
##############   AutoComplite from File. #################

$ComboBox1.AutoCompleteSource      ='CustomSource'
$ComboBox1.AutoCompleteMode        ='SuggestAppend'
foreach($c in $countries){$ComboBox1.AutoCompleteCustomSource.AddRange($c)}
$choice = $ComboBox1.Text

######## If Combobox test -eq Azerbaijan then enable button ###############

$Button1.Enabled = $false

$ComboBox1.add_TextChanged({Combobox})
function Combobox{
if ($ComboBox1.Text -eq 'azerbaijan')
{$Button1.Enabled = $true}
else {$Button1.Enabled = $false}
}



$Form.controls.AddRange(@($ComboBox1,$Button1))

#region gui events {

$Button1.Add_Click({
    $choice = $ComboBox1.SelectedItem
    Add-Type -AssemblyName PresentationCore,PresentationFramework
    $Result = [System.Windows.MessageBox]::Show("Your choice is: $choice ")


  })
#endregion events }

#endregion GUI }


#Write your logic code here

[void]$Form.ShowDialog()
