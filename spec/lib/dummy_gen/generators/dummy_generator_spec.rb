require "spec_helper"

require "dummy_gen/generators/dummy_generator"

describe DummyGen::Generators::DummyGenerator, type: :generator do
  destination DummyGenSpec.tmp_path

  before { prepare_destination }

  describe 'with an engine name' do
    let (:generator_args) { ['engine_name'] }

    describe 'the generated files' do
      before { run_generator generator_args }

      describe 'in spec/dummy' do
        describe 'Rakefile' do
          subject { file('spec/dummy/Rakefile') }

          it { should exist }
          it { should contain /Dummy::Application.load_tasks/ }
        end

        shared_examples_for 'an empty app dir' do |file_path|
          it 'should be a directory' do
            File.directory?(file_path)
          end

          describe 'entries' do
            subject { Dir.new(file(file_path)).entries }
            its(:size) { should == 3 }
            it { should eq(['.', '..', '.gitkeep']) }
          end
        end

        describe 'app/assets' do
          it_should_behave_like 'an empty app dir', 'spec/dummy/app/assets'
        end

        describe 'app/controllers' do
          it_should_behave_like 'an empty app dir', 'spec/dummy/app/controllers'
        end

        describe 'app/helpers' do
          it_should_behave_like 'an empty app dir', 'spec/dummy/app/helpers'
        end

        describe 'app/models' do
          it_should_behave_like 'an empty app dir', 'spec/dummy/app/models'
        end

        describe 'app/views' do
          it_should_behave_like 'an empty app dir', 'spec/dummy/app/views'
        end
      end
    end
  end
end

