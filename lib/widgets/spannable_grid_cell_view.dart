

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:puzzle_game/widgets/spannable_grid.dart';

import 'spannable_grid_cell_data.dart';
import 'spannable_grid_options.dart';
var setaxis=null;
final _availableCells = <List<bool>>[];
class SpannableGridCellView extends StatelessWidget {
  const SpannableGridCellView({
    Key? key,
    required this.data,
    required this.editingStrategy,
    required this.style,
    required this.isEditing,
    required this.isSelected,
    required this.canMove,
    required this.onDragStarted,
    required this.onEnterEditing,
    required this.onExitEditing,
    required this.size,
  }) : super(key: key);

  final SpannableGridCellData data;

  final SpannableGridEditingStrategy editingStrategy;

  final SpannableGridStyle style;

  final bool isEditing;

  final bool isSelected;

  final bool canMove;

  final Function(Offset localPosition) onDragStarted;

  final VoidCallback onEnterEditing;

  final VoidCallback onExitEditing;

  final Size size;



  @override
  Widget build(BuildContext context) {
    var result = data.child!;
    if (isEditing) {
      if (style.contentOpacity < 1.0) {
        result = Opacity(
          // opacity: style.contentOpacity,
          opacity: 1, // TODO: Add opacity here on select
          child: result,
        );
      }
      if (isSelected) {
        result = Stack(
          children: [
            result,
            Container(
              decoration: style.selectedCellDecoration ??
                  BoxDecoration(
                    border: Border.all(
                      // color: Theme.of(context).primaryColor,
                      color: Colors.transparent, // TODO: Selected Border Color
                      width: 4.0,
                    ),
                  ),
            ),
          ],
        );
        if (editingStrategy.exitOnTap) {
          result = GestureDetector(
            onTap: onExitEditing,
            onTapDown: (details) => onDragStarted(details.localPosition),
            child: result,
          );
        }
        result = Draggable<SpannableGridCellData>(
          child: result,
           axis: decideaxis,
          maxSimultaneousDrags: 1,
          feedback: GestureDetector(
            onHorizontalDragUpdate: (details){
              print(details.primaryDelta.toString()+"left gya h");
            },
            child: SizedBox(
              width: size.width,
              height: size.height,

              child: result,

            ),
          ),
          

          childWhenDragging: const SizedBox.shrink(),
          data: data,
          onDraggableCanceled: (velocity, offset) {
            if (editingStrategy.immediate) {
              onExitEditing();
            }
          },
          onDragCompleted: () {
        //    result=SlideAnimation(child: result);
            decideaxis=null;
            direction="";
            print(data.id.toString());
            if (editingStrategy.immediate) {
              onExitEditing();
            }
          },
        );
      }
    } 
    else {
      if (editingStrategy.allowed) {
        if (editingStrategy.enterOnLongTap) {
          result = GestureDetector(
            onLongPress: onEnterEditing,
            child: result,
          );
        } else if (editingStrategy.immediate && canMove) {
          result = GestureDetector(
            onPanDown: (details) {
              onDragStarted(details.localPosition);
              print(details.globalPosition.toString()+" left side ");
              onEnterEditing();
            },
            child: result,
          );
          result = Draggable<SpannableGridCellData>(
            child: result,
            maxSimultaneousDrags: 1,
            feedback: SizedBox(
              width: size.width,
              height: size.height,
              child: result,
            ),
            childWhenDragging: const SizedBox.shrink(),
            data: data,
          );
        }
      }
    }
    return result;
  }



  Axis? decideMoveNearby(SpannableGridCellData cell) {
    final minColumn = cell.column;
    final maxColumn = cell.column + cell.columnSpan - 1;
    final minRow = cell.row;
    final maxRow = cell.row + cell.rowSpan - 1;
    // Check top
    if (cell.row > 1) {
      bool sideResult = true;
      for (int column = minColumn; column <= maxColumn; column++) {
        if (!_availableCells[cell.row - 2][column - 1]) {
          sideResult = false;
          break;
        }
      }
      if (sideResult) {
        direction="top ";
        //return true;
      }
    }
    // Bottom
    if (cell.row + cell.rowSpan - 1 < 5) {
      bool sideResult = true;
      for (int column = minColumn; column <= maxColumn; column++) {
        if (!_availableCells[cell.row + cell.rowSpan - 1][column - 1]) {
          sideResult = false;
          break;
        }
      }
      if (sideResult) {
        direction+="bottom ";
        //return true;
      }
    }
    // Left
    if (cell.column > 1) {
      bool sideResult = true;
      for (int row = minRow; row <= maxRow; row++) {
        if (!_availableCells[row - 1][cell.column - 2]) {
          sideResult = false;
          break;
        }
      }
      if (sideResult) {
        direction+="left ";
        // return true;
      }
    }
    // Right
    if (cell.column + cell.columnSpan - 1 < 4) {
      bool sideResult = true;
      for (int row = minRow; row <= maxRow; row++) {
        if (!_availableCells[row - 1][cell.column + cell.columnSpan - 1]) {
          sideResult = false;
          break;
        }
      }
      if (sideResult) {
        direction+="right ";
        //return true;
      }
    }

    if(direction=="")
    {
      return null;
    }
    else if(direction.split("")=="top" || direction.split("")=="bottom" || direction=="top bottom" )
    {
      return Axis.horizontal;
    }
    else{
      return Axis.vertical;
    }

    //return false;
  }
  
  
}
