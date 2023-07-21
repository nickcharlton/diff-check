require "spec_helper"

RSpec.describe "diff-check" do
  context "with no file change" do
    it "emits no output" do
      session = create_session

      expect(session.run("diff-check")).to have_no_stdout
      expect(session.run("diff-check")).to have_no_stderr
    end

    it "exits with a status code of 0" do
      session = create_session

      expect(session.run("diff-check")).to be_a_success
    end
  end

  context "with a file change" do
    it "emits a summary with the files changed" do
      session = create_session

      session.run("echo 'new text' >> README")

      expect(session.run("diff-check")).to have_stdout(<<~SUMMARY
        These files changed when running the command:

        * README
      SUMMARY
                                                      )
    end

    it "exits with a status of 1" do
      session = create_session

      session.run("echo 'new text' >> README")

      expect(session.run("diff-check")).to be_a_failure
    end
  end

  def create_session
    session = JetBlack::Session.new

    session.run("git init")
    session.run("echo 'Hello world' >> README")
    session.run("git add .; git commit -m 'initial commit'")

    session
  end
end
