<?php
namespace App\Exports;
use App\Post;
use App\Models\Professional;
use Maatwebsite\Excel\Concerns\FromCollection;

class PostExport implements FromCollection
{
  public function collection()
  {
    return Professional::all();
  }
}
?>