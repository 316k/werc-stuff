<h1>%{ echo $pageTitle %}</h1>
% cd $sitedir^$conf_wd
% for(album in `{ls . | grep -v 'index.*' | sed $dirfilter }) {
<div class="album">
    <a href="%{ echo $album %}">
        <img src="%{ ls $album/cover* | sed 1q %}" />
        <h3>%{ sed 1q $album/infos %}</h3>
    </a>
</div>
% }
<style>
.album {
    width: 20em;
    padding: 1em;
    float: left;
    text-align: center;
}
.album img {
    max-width: 100%;
}
</style>
