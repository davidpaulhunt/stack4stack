json.array!(@jobseekers) do |jobseeker|
  json.extract! jobseeker, :id
  json.url jobseeker_url(jobseeker, format: :json)
end
