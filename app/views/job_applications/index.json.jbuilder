json.array!(@job_applications) do |job_apply|
  json.extract! job_apply, :id, :jobseeker_id, :job_post_id
  json.url job_apply_url(job_apply, format: :json)
end
