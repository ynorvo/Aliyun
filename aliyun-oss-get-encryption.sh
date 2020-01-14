aliyun oss ls | awk -F ' ' '{print substr($5,5,20),$7}' >aliyun_oss_buckets.xls
oss_bucket_region=($(aliyun oss ls | awk -F ' ' '{print substr($5,5,20)}'))
oss_bucket_name=($(aliyun oss ls | awk -F ' ' '{print substr($7,7,50)}'))

#echo $oss_bucket_x
#echo $oss_bucket_y

i=0
for str in ${oss_bucket_region[@]}; do
    aliyun oss bucket-encryption  --method get --region:$str oss://${oss_bucket_name[$i]}
    let i=i+1
done
