% check_user
% if(~ $#logged_user 0) {
      <p>Forgot to <a href="/_users/login">login</a> ?</p>
%     exit
% }
% log= # /path/to/apache/access/log
% ips=`{awk '{ print $1 }' $log | sort | uniq}
<h1>awk $stuff $logs</h1>
<h2>Visitors</h2>
<br>
<table>
  <thead>
    <tr>
      <th>ip</th>
      <th>visits</th>
      <th>first visit</th>
      <th>last visit</th>
    </tr>
  </thead>
  <tbody>
% for(ip in $ips) {
    <tr>
      <td>
%    echo $ip
      </td>
      <td>
%    grep $ip $log | wc -l | sed 's/ +/ /g'
      </td>
      <td>
%    grep $ip $log | awk '{ print $4 }' | sed 's/^\[//' | sed 1q
      </td>
      <td>
%    grep $ip $log | awk '{ print $4 }' | sed 's/^\[//' | tail -n 1
      </td>
    </tr>
% }
  </tbody>
</table>

<h2>Page</h2>
<br>
<table>
  <thead>
    <tr>
      <th>page</th>
      <th>views</th>
    </tr>
  </thead>
  <tbody>
% pages=`{awk '{print $7}' $log | sort | uniq}
% for(page in $pages) {
    <tr>
      <td>
%       echo $page
      </td>
      <td>
%       grep $page $log | awk '{ print $1 }' | wc -l
      </td>
    </tr>
% }
  </tbody>
</table>
