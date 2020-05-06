module VersionHistory
  def send_changes_to_version_history(persisted_object)
    version_history_class = "#{persisted_object.class.name.downcase}_versions"
    new_version = Hash.new

    persisted_object.previous_changes.each do |key, changes|
      next if key == ("updated_at" || "created_at")
      new_version[key] = changes.last
    end

    persisted_object.send(version_history_class).create!(new_version)
  end
end