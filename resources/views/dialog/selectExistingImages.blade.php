@extends('layout.modal')
@section('title','Select from existing images')
@section('content')
    <div class="modal-body">
        <div class="row ui-selectable">
            @if(count($photos)>0)
                @foreach($photos as $photo)
                    <div class="col-xs-6 col-sm-4 col-md-3" data-id="{{ $photo->id }}">
                        <div class="thumbnail">
                            <img src="{{ $photo->src }}" alt="">
                        </div>
                    </div>
                @endforeach
            @else
                <div class="col-md-12">
                    <p class="text-muted">Empty</p>
                </div>
            @endif
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary select-btn">Select</button>
    </div>
@stop