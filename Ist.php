*/ Input
enter the alphanumeric string:bhadfdf1205210dfdvana996

Output
the sum is:35
*/
$msg="enter the raw data containing mail addresses:\n";
echo $msg;
//takes a input string with mail id format
$data=fgets(STDIN, 1024);
//pattern to extract @ and . symbol till three characters
$m = '/[a-z0-9_\-\+]+[a-z0-9.\-\+]+@[a-z0-9\-]+\.([a-z]{2,3})(?:\.[a-z]{2})?/i';
//pattern that matches the complete string and stores in to the matches array and the number of matches is returned, that value is stored in l variable
$l=preg_match_all($m, $data, $matches);
echo "extracted email addresses are:\n";
//displays the strings
for($i=0;$i<$l;$i++)
{
 echo $matches[0][$i];
 echo "\n";
}

?>

Input
enter the string:bhgd[!*[!*][!*]]hjiurhyh7t54r

Output
string before modification:bhgd[!*[!*][!*]]hjiurhyh7t54r
string after modification:bhgdhjiurhyh7t54r

*/
$msg="enter the string:";
echo $msg;
//takes a string along with sum nubers
$k=fgets(STDIN, 1024);
echo "string before modification:$k";
//replace '[!*]' with the null
$new_str = preg_replace('~[[][!][*][]]~', "", $k);
//to check if any other pattern like '[!*]' present in new_str, and replaces if present
for($i=0;$i<sizeof($k);$i++)
{
   $new_str = preg_replace('~[[][!][*][]]~', "", $new_str);
}
//displays the new_str
echo "string after modification:$new_str";

?>
