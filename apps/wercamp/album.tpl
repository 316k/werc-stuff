%{
pwd=`{pwd}
cd $sitedir^$conf_wd
songs=()

available_ext=()
for(ext in $audio_ext) {
    if(! ~ `{ls *.$ext | wc -l} 0) {
        available_ext=($available_ext $ext)
    }
}

cover=`{ ls cover* | sed 1q}
%}

<h1>%{ sed 1q infos %}</h1>

<a href="%{ echo -n $cover %}" target="_blank"><img id="wercamp-cover" src="%{ echo -n $cover %}" /></a>

<audio id="wercamp-player" src="%{ sed 3q infos | tail -n1 %}" controls></audio>

<ol id="wercamp-tracklist">
% for(file in *.$available_ext) {
    <li>
        <a href="#!" data-src="%{ echo -n $file %}" onclick="play(this)">%{ echo -n $file | sed 's/(.*)\.(mp3|ogg|flac|wav)/\1/' %}</a>
    </li>
% }
</ol>

% cd $pwd
<div id="wercamp-description">
% tail +4 $sitedir^$conf_wd/infos | $formatter
</div>

<style>
#wercamp-cover {
    float: right;
    width: 50%;
    margin: 10px;
}

#wercamp-player {
    width: 30%;
    margin-top: 10px;
}

#wercamp-description {
    padding: 1em;
    clear: both;
}
</style>
<script>
document.addEventListener("DOMContentLoaded", function() {
    var songs = [
% # TODO : escape quotes
% for(file in *.$available_ext) {
        "%{echo -n $file %}",
% }
    ];
});

function play(song) {
    var player = document.getElementById("wercamp-player");
    player.src = song.dataset.src.trim();
    player.play();
}
</script>
