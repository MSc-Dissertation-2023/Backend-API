require 'zip'

class WelcomeController < ActionController::Base

  # after_action :delete_zipfile, only: :download

  def index
  end

  def download
    download_zip

    respond_to do |format|
      format.zip do
        send_file(
          @zipfile_path,
          filename: @zipfile_name, # Suggested name for browser to use when saving file
          type: "application/zip",
          disposition: "attachment", # Prompt user to download file
          stream: true, # Stream the file to user in real-time
          buffer_size: 512.kilobytes # Buffer size used when streaming
          # x_sendfile: true
        )
      end
    end
  end

  private

  def download_zip
    input_filenames = [
      {
        filename: "[MDK2023] Stage One Stats - (#{DateTime.current.strftime('%Y-%m-%d_%H-%M-%S')}).csv",
        records: StageOneStat.all.order(:created_at)
      },
      {
        filename: "[MDK2023] Stage Two DDA - (#{DateTime.current.strftime('%Y-%m-%d_%H-%M-%S')}).csv",
        records: StageTwoDda.all.order(:created_at)
      },
      {
        filename: "[MDK2023] Stage Two Enemy Metric - (#{DateTime.current.strftime('%Y-%m-%d_%H-%M-%S')}).csv",
        records: StageTwoEnemyMetric.all.order(:created_at)
      },
      {
        filename: "[MDK2023] Stage Two Stats - (#{DateTime.current.strftime('%Y-%m-%d_%H-%M-%S')}).csv",
        records: StageTwoStat.all.order(:created_at)
      }

    ]

    @zipfile_name = "[MDK2023] All Stats - (#{DateTime.current.strftime('%Y-%m-%d_%H-%M-%S')}).zip"

    # Temporary directory to store CSVs before zipping
    temp_dir = "./tmp_csv_dir"
    Dir.mkdir(temp_dir) unless Dir.exists?(temp_dir)

    # Temporary zipfile directory
    temp_zip_dir = "./tmp_zip_dir"
    FileUtils.rm_rf(temp_zip_dir) if Dir.exists?(temp_zip_dir)
    Dir.mkdir(temp_zip_dir)
    @zipfile_path = File.join(temp_zip_dir, @zipfile_name)

    Zip::File.open(@zipfile_path, create: true) do |zipfile|
      input_filenames.each do |file_info|
        csv_content = file_info[:records].to_csv

        temp_file_path = File.join(temp_dir, file_info[:filename])
        File.write(temp_file_path, csv_content) # Writing CSV content to a temporary file

        zipfile.add(file_info[:filename], temp_file_path) # Adding the temporary CSV file to the ZIP
      end
    end

    # Deleting temporary directory with all its content
    FileUtils.rm_rf(temp_dir)
  end
end
