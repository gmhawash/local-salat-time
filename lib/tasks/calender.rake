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
      date = Date.parse(times.shift)
      hijri = times.shift.to_i
      salat = Hash[header.zip(times)]
      
      Day.create :date => date, :hijri => hijri, :salat => salat
    end
  end

  def month
     <<-MONTH
      1-Oct 25  5:50  6:10  7:09  1:01  1:30  4:13  4:30  6:51  7:01  8:12  8:35
      2-Oct 26  5:51  6:10  7:10  1:00  1:30  4:12  4:30  6:49  6:59  8:10  8:35
      3-Oct 27  5:52  6:10  7:11  1:00  1:30  4:10  4:30  6:47  6:57  8:08  8:35
      4-Oct 28  5:53  6:10  7:13  1:00  1:30  4:09  4:30  6:45  6:55  8:06  8:35
      5-Oct 29  5:55  6:20  7:14  12:59 1:30  4:08  4:15  6:43  6:53  8:04  8:20
      6-Oct 1 5:56  6:20  7:15  12:59 1:30  4:06  4:20  6:41  6:51  8:02  8:20
      7-Oct 2 5:57  6:20  7:16  12:59 1:30  4:05  4:20  6:39  6:49  8:00  8:20
      8-Oct 3 5:59  6:20  7:18  12:58 1:30  4:03  4:20  6:37  6:47  7:58  8:20
      9-Oct 4 6:00  6:20  7:19  12:58 1:30  4:02  4:20  6:36  6:46  7:57  8:20
      10-Oct  5 6:01  6:20  7:20  12:58 1:30  4:01  4:20  6:34  6:44  7:55  8:20
      11-Oct  6 6:02  6:20  7:22  12:58 1:30  3:59  4:20  6:32  6:42  7:53  8:20
      12-Oct  7 6:04  6:30  7:23  12:57 1:30  3:58  4:10  6:30  6:40  7:51  8:10
      13-Oct  8 6:05  6:30  7:24  12:57 1:30  3:56  4:10  6:28  6:38  7:49  8:10
      14-Oct  9 6:06  6:30  7:26  12:57 1:30  3:55  4:10  6:27  6:37  7:48  8:10
      15-Oct  10  6:08  6:30  7:27  12:57 1:30  3:54  4:10  6:25  6:35  7:46  8:10
      16-Oct  11  6:09  6:30  7:28  12:57 1:30  3:52  4:10  6:23  6:33  7:44  8:10
      17-Oct  12  6:10  6:30  7:30  12:56 1:30  3:51  4:10  6:21  6:31  7:43  8:10
      18-Oct  13  6:11  6:30  7:31  12:56 1:30  3:50  4:10  6:20  6:30  7:41  8:10
      19-Oct  14  6:13  6:40  7:32  12:56 1:30  3:48  4:00  6:18  6:28  7:39  8:00
      20-Oct  15  6:14  6:40  7:34  12:56 1:30  3:47  4:00  6:16  6:26  7:38  8:00
      21-Oct  16  6:15  6:40  7:35  12:56 1:30  3:46  4:00  6:15  6:25  7:36  8:00
      22-Oct  17  6:16  6:40  7:36  12:55 1:30  3:44  4:00  6:13  6:23  7:35  8:00
      23-Oct  18  6:18  6:40  7:38  12:55 1:30  3:43  4:00  6:11  6:21  7:33  8:00
      24-Oct  19  6:19  6:40  7:39  12:55 1:30  3:42  4:00  6:10  6:20  7:32  8:00
      25-Oct  20  6:20  6:40  7:41  12:55 1:30  3:40  4:00  6:08  6:18  7:30  8:00
      26-Oct  21  6:21  6:50  7:42  12:55 1:30  3:39  3:50  6:06  6:16  7:29  8:00
      27-Oct  22  6:23  6:50  7:43  12:55 1:30  3:38  3:50  6:05  6:15  7:27  8:00
      28-Oct  23  6:24  6:50  7:45  12:55 1:30  3:37  3:50  6:03  6:13  7:26  8:00
      29-Oct  24  6:25  6:50  7:46  12:55 1:30  3:36  3:50  6:02  6:12  7:24  8:00
      30-Oct  25  6:26  6:50  7:47  12:55 1:30  3:34  3:50  6:00  6:10  7:23  8:00
      31-Oct  26  6:28  6:50  7:49  12:55 1:30  3:33  3:50  5:59  6:09  7:22  8:00
    MONTH
  end
end
