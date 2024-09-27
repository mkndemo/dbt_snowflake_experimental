make sure to add streams to the source tables

-- Create a stream on source1
CREATE OR REPLACE STREAM dwh.raw.S_source1_stream
ON TABLE dwh.raw.source1;

-- Create a stream on source2
CREATE OR REPLACE STREAM dwh.raw.S_source2_stream
ON TABLE dwh.raw.source2;

-- Create a stream on source3
CREATE OR REPLACE STREAM dwh.raw.S_source3_stream
ON TABLE dwh.raw.source3;

-- Create a stream on source4
CREATE OR REPLACE STREAM dwh.raw.S_source4_stream
ON TABLE dwh.raw.source4;