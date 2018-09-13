# /bin/sh

dir=$(cd "$(dirname "$0")" && pwd)
nginx_conf_file_path="$dir"/nginx_sv/conf
nginx_conf_file_name='mynetwork.conf'
node_app_dir="$dir"/node_sv/app


if [ -z $(readlink $node_app_dir/dev) ]
    then
    echo "create link $node_app_dir/dev"
    ln -s $node_app_dir/banana $node_app_dir/dev
elif [ $(readlink $node_app_dir/dev) == $node_app_dir/banana ]
    then
    echo "change dev banana to papaya"
    rm $node_app_dir/dev
    ln -s $node_app_dir/papaya $node_app_dir/dev
elif [ $(readlink $node_app_dir/dev) == $node_app_dir/papaya ]
    then
    echo "change dev papaya to banana"
    rm $node_app_dir/dev
    ln -s $node_app_dir/banana $node_app_dir/dev
fi

if [ -z $(readlink $node_app_dir/test) ]
    then
    echo "create link $node_app_dir/test"
    ln -s $node_app_dir/papaya $node_app_dir/test
elif [ $(readlink $node_app_dir/test) == $node_app_dir/banana ]
    then
    echo "change test banana to papaya"
    rm $node_app_dir/test
    ln -s $node_app_dir/papaya $node_app_dir/test
elif [ $(readlink $node_app_dir/test) == $node_app_dir/papaya ]
    then
    echo "change test papaya to banana"
    rm $node_app_dir/test
    ln -s $node_app_dir/banana $node_app_dir/test
fi


# sed -i.bak  "s/papaya/apple/g" "$nginx_conf_file_path/$nginx_conf_file_name"
# sed -i.bak  's/banana/papaya/g' "$nginx_conf_file_path/$nginx_conf_file_name"
# sed -i.bak  's/apple/banana/g' "$nginx_conf_file_path/$nginx_conf_file_name"

# docker exec -i  server_nginx_sv_1 nginx -s reload

