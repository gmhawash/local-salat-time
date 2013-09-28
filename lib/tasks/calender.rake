namespace :calendar do
  desc "import month" 
  task :import => :environment do 

    header = [
     :fajr_athan, :fajr_iqama, 
     :sunrise,
     :dhuhr_athan, :dhuhr_iqama, 
     :asr_athan, :asr_iqama, 
     :maghrib_athan, :maghrib_iqama, 
     :isha_athan, :isha_iqama
    ]

    month.split("\n").each do |day|
      times = day.split(" ").map(&:strip)
      date = Date.strptime(times.shift, '%m/%d/%Y')
      hijri = times.shift.to_i
      salat = Hash[header.zip(times)]
      
      Day.create :date => date, :hijri => hijri, :times => salat
    end
  end

  def month
     <<-MONTH
      10/1/2013 25  5:50  6:10  7:09  1:01  1:30  4:13  4:30  6:51  7:01  8:12  8:35
      10/2/2013 26  5:51  6:10  7:10  1:00  1:30  4:12  4:30  6:49  6:59  8:10  8:35
      10/3/2013 27  5:52  6:10  7:11  1:00  1:30  4:10  4:30  6:47  6:57  8:08  8:35
      10/4/2013 28  5:53  6:10  7:13  1:00  1:30  4:09  4:30  6:45  6:55  8:06  8:35
      10/5/2013 29  5:55  6:20  7:14  12:59 1:30  4:08  4:15  6:43  6:53  8:04  8:20
      10/6/2013 1 5:56  6:20  7:15  12:59 1:30  4:06  4:20  6:41  6:51  8:02  8:20
      10/7/2013 2 5:57  6:20  7:16  12:59 1:30  4:05  4:20  6:39  6:49  8:00  8:20
      10/8/2013 3 5:59  6:20  7:18  12:58 1:30  4:03  4:20  6:37  6:47  7:58  8:20
      10/9/2013 4 6:00  6:20  7:19  12:58 1:30  4:02  4:20  6:36  6:46  7:57  8:20
      10/10/2013  5 6:01  6:20  7:20  12:58 1:30  4:01  4:20  6:34  6:44  7:55  8:20
      10/11/2013  6 6:02  6:20  7:22  12:58 1:30  3:59  4:20  6:32  6:42  7:53  8:20
      10/12/2013  7 6:04  6:30  7:23  12:57 1:30  3:58  4:10  6:30  6:40  7:51  8:10
      10/13/2013  8 6:05  6:30  7:24  12:57 1:30  3:56  4:10  6:28  6:38  7:49  8:10
      10/14/2013  9 6:06  6:30  7:26  12:57 1:30  3:55  4:10  6:27  6:37  7:48  8:10
      10/15/2013  10  6:08  6:30  7:27  12:57 1:30  3:54  4:10  6:25  6:35  7:46  8:10
      10/16/2013  11  6:09  6:30  7:28  12:57 1:30  3:52  4:10  6:23  6:33  7:44  8:10
      10/17/2013  12  6:10  6:30  7:30  12:56 1:30  3:51  4:10  6:21  6:31  7:43  8:10
      10/18/2013  13  6:11  6:30  7:31  12:56 1:30  3:50  4:10  6:20  6:30  7:41  8:10
      10/19/2013  14  6:13  6:40  7:32  12:56 1:30  3:48  4:00  6:18  6:28  7:39  8:00
      10/20/2013  15  6:14  6:40  7:34  12:56 1:30  3:47  4:00  6:16  6:26  7:38  8:00
      10/21/2013  16  6:15  6:40  7:35  12:56 1:30  3:46  4:00  6:15  6:25  7:36  8:00
      10/22/2013  17  6:16  6:40  7:36  12:55 1:30  3:44  4:00  6:13  6:23  7:35  8:00
      10/23/2013  18  6:18  6:40  7:38  12:55 1:30  3:43  4:00  6:11  6:21  7:33  8:00
      10/24/2013  19  6:19  6:40  7:39  12:55 1:30  3:42  4:00  6:10  6:20  7:32  8:00
      10/25/2013  20  6:20  6:40  7:41  12:55 1:30  3:40  4:00  6:08  6:18  7:30  8:00
      10/26/2013  21  6:21  6:50  7:42  12:55 1:30  3:39  3:50  6:06  6:16  7:29  8:00
      10/27/2013  22  6:23  6:50  7:43  12:55 1:30  3:38  3:50  6:05  6:15  7:27  8:00
      10/28/2013  23  6:24  6:50  7:45  12:55 1:30  3:37  3:50  6:03  6:13  7:26  8:00
      10/29/2013  24  6:25  6:50  7:46  12:55 1:30  3:36  3:50  6:02  6:12  7:24  8:00
      10/30/2013  25  6:26  6:50  7:47  12:55 1:30  3:34  3:50  6:00  6:10  7:23  8:00
      10/31/2013  26  6:28  6:50  7:49  12:55 1:30  3:33  3:50  5:59  6:09  7:22  8:00
    MONTH
  end
end
