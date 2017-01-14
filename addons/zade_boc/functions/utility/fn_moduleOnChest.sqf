/*
 * Author: DerZade
 * Triggerd by OnChest-Module
 *
 * Arguments:
 * 0: module <OBJECT>
 * 1: synchronized units <ARRAY>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * n/a
 *
 * Public: No
 */
params ["_module","_units"];

private _backpackClass = _module getVariable "classname";
private _delay = _module getVariable "delay";

_null = [_units,_backpackClass,_delay] spawn {
     params ["_units","_backpackClass","_delay"];
     sleep _delay;
     {
          [_x] call zade_boc_fnc_actionOnChest;

          if (_backpackClass != "") then {
               _x addBackpackGlobal _backpackClass;
          };
     } forEach _units;
};
